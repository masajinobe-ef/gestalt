project('gestalt', 
        'c', 
        version : '0.1',
        license : 'GPL-3.0',
        default_options : [
          'c_std=c11', 
          'warning_level=3', 
          'buildtype=release'
          ]
)

cc = meson.get_compiler('c')
c_args = [
  '-std=c11',
  '-ftree-vectorize',
  '-O3',
  '-Ofast',
  '-pipe',
  '-Wall',
  '-Wextra',
  '-pedantic'
]

# Source files
src = [
  'src/main.c'
]

# Build target
executable(
  'gestalt',
  src,
  c_args : c_args,
  install : true,
  install_dir : meson.project_build_root() / 'bin'
)