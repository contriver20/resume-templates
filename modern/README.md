# Modern Deedy

[![Apache license](https://img.shields.io/github/license/Aarif123456/modern-deedy?style=for-the-badge)](http://www.apache.org/licenses/)

https://github.com/jakeryang/resume

https://github.com/posquit0/Awesome-CV


## Build :hammer:
To make the pdf, the file [resume.tex](resume.tex) will need to be modified. 
The only requirement is `docker` and internet connection. The following commands
 output the pdf to the current working directory. The container built (name latex) will take the longest portion
of the build. 

```bash
docker build -t latex .
docker run --rm -i -v "$PWD":/data latex xelatex resume.tex
```


fonts to install include: 
sudo apt install fonts-roboto fonts-font-awesome