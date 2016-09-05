---
layout: post
title: Jupyter notebook 使用学习
date: 2015-11-10
categories: blog
subtitle: python大法真的好呀
author:     "Norris"
tags: [python]
description: 学习笔记
---

# Ipython Notebook 使用学习

## 学习内容来源于[nbviewer][nbviewer]
[nbviewer]:http://nbviewer.ipython.org/github/ipython/ipython/blob/3.x/examples/Notebook/Index.ipynb

## Basics

#### Basic navigationgs
>* Basic navigation: enter, shift-enter, up/k, down/j
* Saving the notebook: s*Cell types: y, m, 1-6, t
* Cell creation: a, b
* Cell editing: x, c, v, d, z, shift+=
* Kernel operations: i, .

## Running Code

### Code cells allow you to enter and run Python code
>Run a code cell using Shift-Enter or pressing the  button in the toolbar above.


>There are two other keyboard shortcuts for running code:
* Alt-Enter runs the current cell and inserts a new one below.
* Ctrl-Enter run the current cell and enters command mode.

### Managing the IPython Kernel

Code is run in a separate process called the IPython Kernel. The Kernel can be interrupted or restarted. Try running the following cell and then hit the button in the toolbar above.


```python
import time
time.sleep(60) #make the ipython kernel sleep for 60 seconds
```

If the Kernel dies you will be prompted to restart it. Here we call the low-level system libc.time routine with the wrong argument via ctypes to segfault the Python interpreter(Kitty remind: just a example to show how the ipython kernel to die and restart):


```python
import sys
from ctypes import CDLL
# This will crash a Linux or Mac system
# equivalent calls can be made on Windows
dll = 'dylib' if sys.platform == 'darwin' else 'so.6'
libc = CDLL("libc.%s" % dll) 
libc.time(-1)  # BOOM!!
```

### Cell menu
The "Cell" menu has a number of menu items for running code in different ways. These includes:

* Run and Select Below
* Run and Insert Below
* Run All
* Run All Above
* Run All Below

### Restarting the kernels
The kernel maintains the state of a notebook's computations. You can reset this state by restarting the kernel. This is done by clicking on the  in the toolbar above.

### sys.stdout and sys.stderr
The stdout and stderr streams are displayed as text in the output area.


```python
print("Hi,stdout")
```


```python
from __future__ import print_function
print("Hi,stderr",file=sys.stderr)
```

### Output is asynchronous
All output is displayed asynchronously as it is generated in the Kernel. If you execute the next cell, you will see the output one piece at a time, not all at the end.


```python
import time,sys
for i in range(8):
    print(i)
    time.sleep(0.5)
```

### Large outputs
To better handle large outputs, the output area can be collapsed. Run the following cell and then single- or double- click on the active area to the left of the output:


```python
for i in range(50):
    print(i)
```

Beyond a certain point, output will scroll automatically:


```python
for i in range(500):
    print(2**i - 1)
```

## Markdown Cells
All the information is in the doucument named "Markdown 使用学习",besides,you can refer the document from [markdown notes in ipython notebook websites][notes],something new you will view.
[notes]:http://nbviewer.ipython.org/github/ipython/ipython/blob/3.x/examples/Notebook/Working%20With%20Markdown%20Cells.ipynb

## Configuring the Notebook and Server
### Configuring the IPython Notebook
The notebook web server can also be configured using IPython profiles and configuration files. The Notebook web server configuration options are set in a file named ipython_notebook_config.py in your IPython profile directory. The profile directory is a subfolder of your IPython directory, which itself is usually .ipython in your home directory.



You can display the location of your default profile directory by running the command:




```python
!ipython profile locate default
```
