# Copyright 2026 Red Hat, Inc
# SPDX-License-Identifier: MIT

rusticl_kernels_files = files(
  'copy.cl'
)

rusticl_kernels_spv_rs = custom_target(
  input : rusticl_kernels_files,
  output : 'rusticl_kernels.spv',
  command : [
    prog_mesa_clc, '-o', '@OUTPUT@', '--depfile', '@DEPFILE@',
    rusticl_kernels_files, '--',
    '-I' + join_paths(meson.project_source_root(), 'src/compiler/libcl'),
    '-I' + join_paths(meson.current_source_dir(), '.'),
    cl_args,
    ],
  depfile : 'ruticl_shaders.h.d',
)

rusticl_kernels_spv = static_library(
  'rusticl_kernels',
  structured_sources(
    'lib.rs',
    {
      'gen/' : [rusticl_kernels_spv_rs],
    },
  ),
  gnu_symbol_visibility : 'hidden',
  rust_abi : 'rust',
)
