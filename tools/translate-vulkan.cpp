#include "hlslcc.h"
#include <cstdio>
#include <vector>
#include <io.h>
#include <fcntl.h>

struct Diagnostics : HLSLccReflection {
    void OnDiagnostics(const std::string& message, int, bool error) override {
        std::fprintf(stderr, "%s: %s\n", error ? "ERROR" : "INFO", message.c_str());
    }
};
int main() {
    _setmode(_fileno(stdin), _O_BINARY);
    _setmode(_fileno(stdout), _O_BINARY);
    uint32_t size;
    while (std::fread(&size, 4, 1, stdin) == 1 && size) {
        if (size > 16 * 1024 * 1024) return 2;
        std::vector<char> bytes(size);
        if (std::fread(bytes.data(), 1, size, stdin) != size) return 3;
        GLSLShader shader; GLSLCrossDependencyData dependencies;
        HLSLccSamplerPrecisionInfo precisions;
        Diagnostics diagnostics;
        GlExtensions extensions = {};
        const unsigned flags = HLSLCC_FLAG_UNIFORM_BUFFER_OBJECT | HLSLCC_FLAG_UNIFORM_BUFFER_OBJECT_WITH_INSTANCE_NAME | HLSLCC_FLAG_INOUT_SEMANTIC_NAMES | HLSLCC_FLAG_DISABLE_FASTMATH | HLSLCC_FLAG_VULKAN_BINDINGS;
        uint32_t ok = TranslateHLSLFromMem(bytes.data(), flags, LANG_440, &extensions, &dependencies, precisions, diagnostics, &shader);
        uint32_t length = ok ? (uint32_t)shader.sourceCode.size() : 0;
        std::fwrite(&length, 4, 1, stdout);
        if (length) std::fwrite(shader.sourceCode.data(), 1, length, stdout);
        std::fflush(stdout);
    }
}
