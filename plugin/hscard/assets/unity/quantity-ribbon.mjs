import {resourceURL, resourceFetch} from './resource-url.mjs?ver=hscard-6f5666d116dae839';
/**
 * Quantity ribbon is part of the same Unity-compatible WebGL card scene.
 * A quantity of 1 has no ribbon; any positive quantity >= 2 is drawn on the
 * attached frame mesh in the same transparent framebuffer as the card.
 * No detached DOM badge, overlay, or second canvas is involved.
 *
 * The imagery uses a baked digit atlas of the original Belwe lettering, not a
 * runtime web font.  That lets even a nonstandard deck quantity show x3, x10,
 * etc. without adding a maximum number of copies.
 */
export const RIBBON_EXTENT = 72;
// Maximum native frame height across all supported normal/golden fits.
// Every card reserves the same ribbon area, including single-copy cards.
export const CARD_BODY_EXTENT = 610;
export const CARD_SCENE_WIDTH = 436;
export const CARD_SCENE_HEIGHT = CARD_BODY_EXTENT + RIBBON_EXTENT;
export const RIBBON_CENTER_X = CARD_SCENE_WIDTH / 2;
export const RIBBON_BOTTOM = 4;
const PLATE_WIDTH = 512;
const PLATE_HEIGHT = 348;
const DIGIT_CELL_WIDTH = 240;
const RIBBON_WIDTH_FRACTION = 0.324;
const DIGIT_ADVANCE = 142; // Measured advance of the native ribbon digits.
const DIGIT_CENTER_X = 289;
const DIGIT_CENTER_Y = 123;
const DIGIT_AVAILABLE_WIDTH = 154;
const textureCache = new Map();
let assetsPromise;

export function cardSceneContext(fit, quantity) {
  const width = CARD_SCENE_WIDTH, height = CARD_SCENE_HEIGHT;
  const projection = fit.sourceProjection.slice();
  // Native frames share a world origin and scale. Per-type/finish crop offsets
  // previously moved that origin relative to the fixed quantity ribbon.
  // Keep the same camera origin for every type, rarity and finish instead.
  projection[0] *= fit.width / width;
  projection[5] = projection[0] * width / height;
  projection[12] = 0;
  projection[13] = 0;
  return {
    view: fit.sourceView,
    projection,
    width,
    height,
    time: 1,
    linear: false
  };
}

async function imageAssets() {
  if (!assetsPromise) {
    assetsPromise = (async () => {
      const load = async name => {
        const response = await resourceFetch(resourceURL(name.replace(/^\.\//, "")), {credentials:'same-origin'});
        if (!response.ok) throw Error('Quantity ribbon asset ' + response.status);
        return createImageBitmap(await response.blob(), {premultiplyAlpha:'none'});
      };
      const [plate, digits] = await Promise.all([
        load('./quantity-ribbon-base.png'), load('./quantity-ribbon-digits.png')
      ]);
      if (plate.width !== PLATE_WIDTH || plate.height !== PLATE_HEIGHT ||
          digits.width !== DIGIT_CELL_WIDTH * 10 || digits.height !== PLATE_HEIGHT) {
        plate.close(); digits.close();
        throw Error('Invalid quantity ribbon asset dimensions');
      }
      return {plate,digits};
    })().catch(error => {assetsPromise = null; throw error;});
  }
  return assetsPromise;
}

async function ribbonPixels(quantity) {
  if (!Number.isSafeInteger(quantity) || quantity < 2) {
    throw Error('Invalid quantity ribbon value');
  }
  if (!textureCache.has(quantity)) {
    const task = (async () => {
      const {plate,digits} = await imageAssets();
      const canvas = document.createElement('canvas');
      canvas.width = PLATE_WIDTH;
      canvas.height = PLATE_HEIGHT;
      const ctx = canvas.getContext('2d',{willReadFrequently:true});
      if (!ctx) throw Error('Quantity ribbon canvas unavailable');
      ctx.drawImage(plate,0,0);
      const label = String(quantity);
      const scale = Math.min(1,DIGIT_AVAILABLE_WIDTH / (label.length * DIGIT_ADVANCE));
      const firstCenter = DIGIT_CENTER_X - (label.length - 1) * DIGIT_ADVANCE * scale / 2;
      for (let i = 0; i < label.length; i++) {
        const digit = label.charCodeAt(i) - 48;
        const centerX = firstCenter + i * DIGIT_ADVANCE * scale;
        ctx.drawImage(digits, digit * DIGIT_CELL_WIDTH, 0,
          DIGIT_CELL_WIDTH, PLATE_HEIGHT,
          centerX - DIGIT_CELL_WIDTH * scale / 2,
          DIGIT_CENTER_Y * (1-scale),
          DIGIT_CELL_WIDTH * scale, PLATE_HEIGHT * scale);
      }
      const image = ctx.getImageData(0,0,PLATE_WIDTH,PLATE_HEIGHT).data;
      const result = new Uint8Array(image.length);
      const stride = PLATE_WIDTH * 4;
      // WebGL coordinates use the bottom row first.
      for (let row=0;row<PLATE_HEIGHT;row++) {
        result.set(image.subarray(row*stride,(row+1)*stride),
          (PLATE_HEIGHT-1-row)*stride);
      }
      return {width:PLATE_WIDTH,height:PLATE_HEIGHT,format:28,levels:[result]};
    })().catch(error => {textureCache.delete(quantity);throw error;});
    textureCache.set(quantity,task);
  }
  return textureCache.get(quantity);
}

/** Adds one camera-aligned textured mesh to the card renderer's draw commands. */
export async function quantityRibbonPart(context,quantity) {
  if (!Number.isSafeInteger(quantity) || quantity < 2) return null;
  const {width,height,projection} = context;
  const view = context.view;
  if (!view || Math.abs(view[0]-1)>1e-5 ||
      Math.abs(view[6]+1)>1e-5 || Math.abs(view[9]-1)>1e-5) {
    throw Error('Unsupported card projection for quantity ribbon');
  }
  const spriteWidth=width*RIBBON_WIDTH_FRACTION;
  const spriteHeight=spriteWidth*PLATE_HEIGHT/PLATE_WIDTH;
  const center=RIBBON_CENTER_X;
  const left=center-spriteWidth/2;
  const right=center+spriteWidth/2;
  const bottom=RIBBON_BOTTOM;
  const top=bottom+spriteHeight;
  const toX=x=>(2*x/width-1-projection[12])/projection[0];
  const toZ=y=>(2*y/height-1-projection[13])/projection[5];
  const l=toX(left),r=toX(right),b=toZ(bottom),t=toZ(top);
  const identity=[1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1];
  return {
    path:'card-decoration/quantity-ribbon',slot:0,
    mesh:{
      attributes:new Map([
        ['POSITION0',new Float32Array([l,2,b,1,r,2,b,1,r,2,t,1,l,2,t,1])],
        ['TEXCOORD0',new Float32Array([0,0,0,0,1,0,0,0,1,1,0,0,0,1,0,0])],
        ['COLOR0',new Float32Array(16).fill(1)],
        ['NORMAL0',new Float32Array([0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0])]
      ]),
      indices:new Uint32Array([0,2,1,0,3,2])
    },
    material:{
      shader:'Hidden/TextPlane',keywords:[],values:{_Color:[1,1,1,1]},
      textures:{_MainTex:{pixels:await ribbonPixels(quantity),
        sampler:{filter:1,wrapU:1,wrapV:1,wrapW:1},st:[1,1,0,0]}}
    },
    pose:identity
  };
}
