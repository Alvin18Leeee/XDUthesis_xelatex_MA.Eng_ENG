# 说明

本模板根据[himingway/XDUthesis_xelatex](https://github.com/himingway/XDUthesis_xelatex)修改。

直接适用于：使用**英文**撰写的**工程硕士**（专业学位）论文。

若您的论文使用中文撰写，请直接使用[himingway/XDUthesis_xelatex](https://github.com/himingway/XDUthesis_xelatex)即可。

如需更换为工学硕士（学术学位）模板，请继续阅读本文档，后续会提到如何更换。

如需调整其他细节，请仔细阅读XDUthesis.cls和XDUthesis.def并修改相应的的代码。

# 修改说明

1. 调整了中英文摘要的先后顺序
2. 将全文偶数页页眉修改为英文
3. 修改“插图索引”“表格索引”等章节为相应的英文名称，更新了这些章节在目录中的英文显示
4. 修改“图/表 X.X”为“Fig./TABLE X.X”
5. 在示例中英文摘要的每段之间增加了空行，使其符合规范

# 说明

本模版根据[103yiran/XDUthesis_xelatex](https://github.com/103yiran/XDUthesis_xelatex)修改。

# 修改说明

## 1. 修改导师名字太长显示不正确问题

### 修改前：

![](https://github.com/himingway/XDUthesis_xelatex/raw/master/screenshoot/1-1.png)

### 修改后：

![](https://github.com/himingway/XDUthesis_xelatex/raw/master/screenshoot/1-2.png)

## 2. 修改页眉

### 修改前：

![](https://github.com/himingway/XDUthesis_xelatex/raw/master/screenshoot/2-1.png)

### 修改后：

![](https://github.com/himingway/XDUthesis_xelatex/raw/master/screenshoot/2-2.png)

## 3. 修改摘要中段落之间间距问题

### 修改前：

![](https://github.com/himingway/XDUthesis_xelatex/raw/master/screenshoot/3-1.png)

### 修改后：

![](https://github.com/himingway/XDUthesis_xelatex/raw/master/screenshoot/3-2.png)

## 4. 修改图目录和表目录格式问题

### 修改前：

![](https://github.com/himingway/XDUthesis_xelatex/raw/master/screenshoot/4-1.png)

### 修改后：

![](https://github.com/himingway/XDUthesis_xelatex/raw/master/screenshoot/4-2.png)

## 5. 修改符号目录格式问题

### 修改前：

![](https://github.com/himingway/XDUthesis_xelatex/raw/master/screenshoot/5-1.png)

### 修改后：

![](https://github.com/himingway/XDUthesis_xelatex/raw/master/screenshoot/5-2.png)


---
# What is XDUthesis_xelatex?

XDUthesis_xelatex is an *unofficial* XeLaTeX template for preparing bachelor, master, or doctor thesis in Xidian University.

# 西安电子科技大学学位论文LaTex模板


本模板根据西安电子科技大学研究生院发布的[研究生学位论文模板（2015版）](http://gr.xidian.edu.cn/system/_content/download.jsp?urltype=news.DownloadAttachUrl&owner=1281831001&wbfileid=2041391)修改而成，并满足其规定的格式要求。研究生院官方发布的模板编译方式为latex，采用GBK编码，仅支持CTeX(2.9.2)。官方模板部分语法老旧，本模板修正了其中存在的一些问题，并且支持xelatex编译，使用时更为便利。模板采用UTF-8编码，支持Linux和TeX Live 2016。

## 如何使用

* 本模板的默认封面为工程硕士封面，这一点与官方模板不同。工学硕士使用时需将XDUthesis.cls中的chinese  cover和english  cover部分替换为coverForMasterOfScience.cls文件中的内容。XDUthesis.cls文件设定了论文的排版格式。

* 论文和作者的相关信息可在XDUthesis.cfg文件中进行修改。

* 参考文献在./bib/tex.bib文件中录入。百度学术和谷歌学术均支持BibTeX格式导出，但其中夹杂很多不规范的条目，应注意进行检查。


## 系统需求

本模板需要使用 XeTeX 引擎编译。Linux下编译时需首先配置windows系统中提供的SimSun和SimHei字体。模板验证无问题的平台为Debian 8 和TeX Live 2016。

## 知已问题
使用XeTeX时，AutoFakeBold选项导致复制乱码。模板中在`\begin{document}`后插入一个日文的空格'　'，使得除章节一级标题外其他内容可复制。


