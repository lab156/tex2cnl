## Description of the tex2cnl package
The **tex2cnl** package provides the `\CNLexpand` macro and the `\begin{CNL} ... \end{CNL}` environment. This allows users to simultaneously typeset their documents in LaTeX and check its correctness with the CNL.  The TeXCNL engine ignores everything in the TeX file except for what is placed inside this environment. 

* To check the tests run _make_ and _make clean_.

A _control sequence_ is any LaTeX command. The user can specify how the CNL environment  deals with every command sequence `\cs` that appears within `\begin{CNL} ... \end{CNL}`. This is done by using the following options provided by the **tex2cnl** package:
- `\CNLnoexpand\cs` : This is the default behaviour, the name is copied to the CNL with no macro expansion.
    * Ex. `\CNLnoexpand\RR`  copies the macro `\RR` without expanding it.
- `\CNLexpand\cs` : The macro is expanded to generate the output to the CNL file. To do the expansion, the definition of `\cs` must be given inside the CNL environment. When a control sequence takes arguments`\CNLexpand 2 \cs` will do macro expansion on `\cs` and its two arguments
        * For example, the macro
        ```tex
        \newcommand{\RR}{\mathbb{R}} % no arguments
        \newcommand{\pder}[2][]{\frac{\partial#1}{\partial#2}}
        \CNLnoexpand\RR
        ```
- `\CNLdelete\cs` : Whenever the control sequence, no output is produced in the CNL and the token is deleted. `\CNLdelete 2 \cs` deletes `\cs` and its two arguments.
- `\CNLcustom\cs{...}` : the text in curly braces is used for the macro expansion of the `\cs` instead of the actual definition.

Programming type control sequences are disabled. For example `\futurelet` nand `\expandafter` 
* `\expandafter` reverses the order of expansions.
* By `expansion` we mean the replacement of the macro and its arguments
     
When the `isPresentation` flag is set to `true`, the file is processed as an ordinary .tex file. 

### Notes
- It is not necessary to write out to an external file. All the processing can be done withing the .tex file
- Currently supporting macros defined with `newcommand`.
