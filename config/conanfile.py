from conans import ConanFile, CMake


class CMakeSuiteSparseConfig(ConanFile):
    """ Conanfile for Suitesparse Config """
    name = "CMakeSuiteSparseConfig"
    version = "5.4.0"
    url = "https://github.com/pleroux0/CMakeSuiteSparseConfig/"

    settings = "os", "compiler", "build_type", "arch"
    options = {"shared": [True, False], "PIC": [True, False]}
    default_options = {"shared": True}

    generators = "cmake"
    export_sources = "cmake/*", "CMakeLists.txt"

    def configure(self):
        if self.options.shared:
            del self.options.PIC

    def _cmake_configure(self):
        cmake = CMake(self)

        if self.options.shared:
            cmake.definitions["BUILD_SHARED_LIBS"] = True
        elif self.options.PIC:
            cmake.definitions["WITH_PIC"] = True

        cmake.configure()

        return cmake

    def build(self):
        cmake = self._cmake_configure()
        cmake.build()

    def package(self):
        cmake = self._cmake_configure()
        cmake.install()
