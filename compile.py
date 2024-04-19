import subprocess, sys, os, time

def main():
    files = ['dissertation']
    for file in files:
        clean(file)
        compile(file)
        # Wait a bit so that all files that will be dropped have been created
        time.sleep(3)
        clean(file)

def compile(file):
    commands = [
        ['pdflatex',    file + '.tex'],
        ['biber',       file],
        ['pdflatex',    file + '.tex'],
        ['pdflatex',    file + '.tex']
    ]
    for c in commands:
        subprocess.call(c)

def clean(file):
    suffixes = ('aux', 'bbl', 'bcf', 'blg', 'fdb_latexmk', 'fls', 'log', 'out', 'run.xml', 'synctex.gz', 'toc')
    for suffix in suffixes:
        try:
            os.remove(str(file) + '.' + suffix)
        except FileNotFoundError:
            continue

if __name__ == "__main__":
    main()
