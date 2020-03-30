# Thoughts on dealing with data

This is intended as a collection of random thoughts for how to deliver data in such a way that it's amenable to using programmatic tools, and some tips, tricks, and pitfalls that might be useful.

## Text

First off, the universal language of data science is *text*. Above all, unless you are dealing with specialized software, data should be delivered in an ASCII text file. This implies a few guidelines:

- First, learn and become comfortable with a text editor.
	- Atom and VS Code are both free options and available on all three major platforms (MacOS, Linux, Windows).
	- Sublime is shareware and available on all three major platforms.
	- On MacOS, there are also BBEdit and Textmate
		- The built-in "TextEdit" defaults to formatted (RTF) text. Don't use it.
	- On Windows, there is Notepad++
		- The built-in "Notepad" is a text editor, but a terrible one. Don't use it.
	- On linux, there are graphical versions of Vim and Emacs.
- Microsoft Word is not a text editor! (Neither is Google Docs).

### File formats

CSV (comma-separated values) and TSV (tab-separated values) are both reasonable ways to present data. Every civilized programming language has an easy way to deal with them, and they keep the data in a structured form, so that individual data fields are easily identified.

### Line endings

One pitfall that still plagues us from the 1980s is that there isn't a single standard for what character ends a line! When you hit the return/enter key, what happens actually depends on your operating system:

- On MacOS and Linux, a "newline" character (ASCII value 10) is emitted
- On Windows, a both a "newline" and a "carriage return" (ASCII value 13) are emitted
- Prior to about 2001, on MacOS, just a "carriage return" was emitted.
	- Unfortunately, Microsoft's software (Word, Excel) preserve this behavior on MacOS to this day.

In any decent text editor, you get complete control over line-ending behavior, and can easily change it. But, if you export a CSV file from Excel, note that it will probably default to Windows (or old-style MacOS) line endings, and will need converted if someone is going to use it programmatically (e.g. from a Python script).

### Why all this matters

Virtually every public database of biological data, including Uniprot, Genbank, and PDB, supports the ability to programmatically do batch searches (for example, you have a thousand Uniprot IDs; you don't have to do a thousand manual web searches). But if these data are locked up in a Word document, they are inaccessible to the sort of quick-and-dirty program (e.g. a Python script) that someone could use to do that batch query. Instead, it's best to present data in a consistent, simple way that any programmer can easily access from their scripting language of choice: a simple, structured text document like CSV.

## Precision

When a programmer designs a solution to a problem, they need to be precise as to the specifications of the data. This might be best illustrated by a classic (perhaps apocryphal) story:

- Biologist says to programmer "I need a program that deals with gene sequences, and gene sequences contain the letters A, C, G, and T"
- Programmer thinks "Ooh, a four-letter alphabet; I can use two bits per character to represent this really efficiently!"
- Programmer writes the program they think the biologist wanted
- Biologist tries it out, and it crashes
- Programmer looks into it, and realizes the DNA sequences also contain the letter "N" (typically representing a no-call, or wildcard).
- Programmer asks biologist why they didn't mention that "N" could also be in the sequence.
- Biologist is confused as to why it makes any difference.

