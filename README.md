# nankai.cls

![version-2.1.1](https://img.shields.io/badge/version-2.1.1-blue)
![GitHub License](https://img.shields.io/github/license/alumik/nankai.cls)

This unofficial LaTeX package provides a class for creating documents for people working with Nankai University.

This project is inspired by *huawei – Template for Huawei documents* [[CTAN]](https://ctan.org/pkg/huawei) [[GitHub]](https://github.com/yegor256/huawei.cls).

The user's guide can be found at [GitHub Releases](https://github.com/alumik/nankai.cls/releases).

We recommend you to use `latexmk` to compile your `.tex` files to PDF files.

Disclaimer: This is **NOT** a product of Nankai University. This package is created to help some people render documents in LaTeX format. You are welcome to use it at your own risk.

## Usage

### Download and Install `nankai`

1. Clone/download all files in this template locally.
2. Get the `nankai.cls` file.
   One of the following two methods can be selected:
    
    - Method 1: Download the latest version of the `nankai.cls` file from [Release](https://github.com/alumik/nankai.cls/releases/latest) and put it into the working directory.
    - Method 2: Use the following command to extract `nankai.cls` from `nankai.dtx`.

      ```
      xelatex nankai.ins
      ```

3. Use pdfLaTeX/XeLaTeX/LuaLaTeX to compile the your `*.tex` file.
   This template already provides the `latexmkrc` configuration file, and pdfLaTeX is called by default when compiled using the `latexmk` command.

    ```
    latexmk <filename>.tex
    ```

### Optional Steps: Build the Documentation

If you want to build an instructional document for this template, you can refer to the following steps:

1. Clone/download all files in this repository to local.
2. Execute in the template folder

    ```
    latexmk nankai.dtx
    ```

    You can generate the `nankai.pdf` file, which is the template description document in the directory.
