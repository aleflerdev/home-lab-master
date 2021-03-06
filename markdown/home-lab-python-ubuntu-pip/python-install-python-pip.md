## How To Install Python 3 and Set Up a Programming Environment on an Ubuntu 20.04 Server
Introduction
The Python programming language is an increasingly popular choice for both beginners and experienced developers. Flexible and versatile, Python has strengths in scripting, automation, data analysis, machine learning, and back-end development. First published in 1991 with a name inspired by the British comedy group Monty Python, the development team wanted to make Python a language that was fun to use.

This tutorial will get your Ubuntu 20.04 server set up with a Python 3 programming environment. Programming on a server has many advantages and supports collaboration across development projects. The general principles of this tutorial will apply to any distribution of Debian Linux.

Prerequisites
In order to complete this tutorial, you should have a non-root user with sudo privileges on an Ubuntu 20.04 server. To learn how to achieve this setup, follow our initial server setup guide.

If you’re not already familiar with a terminal environment, you may find the article “An Introduction to the Linux Terminal” useful for becoming better oriented with the terminal.

With your server and user set up, you are ready to begin.

Step 1 — Setting Up Python 3
Ubuntu 20.04 and other versions of Debian Linux ship with Python 3 pre-installed. To make sure that our versions are up-to-date, let’s update and upgrade the system with the apt command to work with Ubuntu’s Advanced Packaging Tool:
```bash
sudo apt update
sudo apt -y upgrade
```
The -y flag will confirm that we are agreeing for all items to be installed, but depending on your version of Linux, you may need to confirm additional prompts as your system updates and upgrades.

Once the process is complete, we can check the version of Python 3 that is installed in the system by typing:
```bash
python3 -V
```
You’ll receive output in the terminal window that will let you know the version number. While this number may vary, the output will be similar to this:
```bash
Output
Python 3.8.2
```
To manage software packages for Python, let’s install pip, a tool that will install and manage programming packages we may want to use in our development projects. You can learn more about modules or packages that you can install with pip by reading “How To Import Modules in Python 3.”
```bash
sudo apt install -y python3-pip
```
Python packages can be installed by typing:

pip3 install package_name
Here, package_name can refer to any Python package or library, such as Django for web development or NumPy for scientific computing. So if you would like to install NumPy, you can do so with the command pip3 install numpy.

There are a few more packages and development tools to install to ensure that we have a robust setup for our programming environment:
```bash
sudo apt install -y build-essential libssl-dev libffi-dev python3-dev
```
Once Python is set up, and pip and other tools are installed, we can set up a virtual environment for our development projects.

#### Step 2 — Setting Up a Virtual Environment
Virtual environments enable you to have an isolated space on your server for Python projects, ensuring that each of your projects can have its own set of dependencies that won’t disrupt any of your other projects.

Setting up a programming environment provides greater control over Python projects and over how different versions of packages are handled. This is especially important when working with third-party packages.

You can set up as many Python programming environments as you would like. Each environment is basically a directory or folder on your server that has a few scripts in it to make it act as an environment.

While there are a few ways to achieve a programming environment in Python, we’ll be using the venv module here, which is part of the standard Python 3 library. Let’s install venv by typing:
```bash
sudo apt install -y python3-venv
```
With this installed, we are ready to create environments. Let’s either choose which directory we would like to put our Python programming environments in, or create a new directory with mkdir, as in:
```bash
mkdir environments
cd environments
```
Once you are in the directory where you would like the environments to live, you can create an environment by running the following command:
```bash
python3 -m venv my_env
```
Essentially, `my_env` sets up a new directory that contains a few items which we can view with the ls command:
```bash
ls my_env
```
```bash
Output
bin include lib lib64 pyvenv.cfg share
```
Together, these files work to make sure that your projects are isolated from the broader context of your server, so that system files and project files don’t mix. This is good practice for version control and to ensure that each of your projects has access to the particular packages that it needs. Python Wheels, a built-package format for Python that can speed up your software production by reducing the number of times you need to compile, will be in the Ubuntu 20.04 share directory.

To use this environment, you need to activate it, which you can achieve by typing the following command that calls the activate script:
```bash
source my_env/bin/activate
```
Your command prompt will now be prefixed with the name of your environment, in this case it is called my_env. Depending on what version of Debian Linux you are running, your prefix may appear somewhat differently, but the name of your environment in parentheses should be the first thing you see on your line:
```bash
(my_env) sammy@ubuntu:~/environments$
```
This prefix lets us know that the environment my_env is currently active, meaning that when we create programs here they will use only this particular environment’s settings and packages.

Note: Within the virtual environment, you can use the command python instead of python3, and pip instead of pip3 if you would prefer. If you use Python 3 on your machine outside of an environment, you will need to use the python3 and pip3 commands exclusively.

After following these steps, your virtual environment is ready to use.



#### Step 3 — Creating a “Hello, World” Program

Now that we have our virtual environment set up, let’s create a traditional “Hello, World!” program. This will let us test our environment and provides us with the opportunity to become more familiar with Python if we aren’t already.

To do this, we’ll open up a command-line text editor such as nano and create a new file:

```python
(my_env) sammy@ubuntu:~/environments$
```
Once the text file opens up in the terminal window we’ll type out our program:

```python
print("Hello, World!")
```
Exit nano by typing the `CTRL` and `X` keys, and when prompted to save the file press `y`.

Once you exit out of nano and return to your shell, let’s run the program:
```python
(my_env) sammy@ubuntu:~/environments$
```
The hello.py program that you just created should cause your terminal to produce the following output:
```python
Output
Hello, World!
```
To leave the environment, type the command deactivate and you will return to your original directory.