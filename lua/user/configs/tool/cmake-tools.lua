return function()
	require("cmake-tools").setup({
		cmake_build_directory = "build/${variant:buildType}",
	})
end
