" TO CHANGE {{{1
let conda_dir=''
let g:python3_host_prog=conda_dir . 'python'
let g:ale_python_mypy_executable=conda_dir . 'mypy'
let g:ale_python_flake8_executable=conda_dir . 'flake8'
let g:ale_python_pylint_executable=conda_dir . 'pylint'
let g:blocklint_command=conda_dir . 'blocklint'
