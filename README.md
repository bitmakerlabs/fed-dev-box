# Front-End Development Environment

This is a packaged development environment for working on projects for Front-End Development. Using this system allows us to quickly get everyone using the same environment so we can focus on introducing web development concepts rather than spending time configuring individual machines.

## Pre-requisites

There are three pieces of software that must be installed on your machine before beginning:

1. [Git](http://git-scm.com/downloads)
2. [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
3. [Vagrant](http://www.vagrantup.com/downloads.html)

These three pieces of software have easy-to-use, click-through installers for all major operating systems.

> **If you are using Windows**, you may need to enable hardware virtualization (VT-x). It can usually be enabled via your BIOS.


## Setup

1. Open Terminal (Mac) or Git Bash (Windows)
2. Clone this repository to your computer (`git clone ...`)
3. Move into the directory for the repository (`cd fed-dev-box`)
4. Run `VBoxManage dhcpserver remove --netname HostInterfaceNetworking-vboxnet0`
  - Ignore if running on a Windows machine
  - Copying and pasting is simplest
5. To execute the vagrant script, run `vagrant up`
  - This may take several minutes to complete

Once these steps are complete, you will have a fully working Linux environment for your code.


## Usage

Your projects will live in the `projects` subfolder of `fed-dev-box`. To get started you'll need to fire up your Vagrant box and connect to it.

### Creating a new project

1. In the root folder of `fed-dev-box` run `vagrant up`
2. Connect to Vagrant (`vagrant ssh`)
3. When it connects, switch into the projects folder with `cd projects`
4. Run `yo bitmaker` to generate a new project
  - Follow the prompts to customize your projects to your needs
5. Once the generator is finished, switch into your new project directory (`cd my-project`)
6. Run `grunt` to start watching your files for changes
7. Switch over to Sublime Text and open your project folder via `File -> Open`
8. Open your web browser to `http://localhost:9000` to see the changes as you make them

### Working on existing projects

1. In the root folder of `fed-dev-box` run `vagrant up`
2. Connect to Vagrant (`vagrant ssh`)
3. When it connects, switch into the projects folder with `cd projects`
  -  If cloning a project from Github, run `git clone ...`
4. Switch into your project directory (`cd my-project`)
  - If you cloned a project, you'll now need to run `npm install && bower install`
  - If you're running Windows, add `--no-bin-links` after `npm install` ([see below](#troubleshooting-windows))
5. Run `grunt` to start watching your files for changes
6. Switch over to Sublime Text and open your project folder via `File -> Open`
7. Open your web browser to `http://localhost:9000` to see the changes as you make them

### Terminating your session

1. Stop the grunt task by pressing `ctrl + c`
2. Type `exit` to get out of Vagrant
3. Run `vagrant suspend` to finish your session with Vagrant


## Troubleshooting Windows

1. When starting Git Bash (or PowerShell), always **Run as Administrator**
2. If you see errors when starting a new project, run the following commands in your project directory:
  - `rm -Rf node_modules`
  - `npm install --no-bin-links`
3. Any time you need to run `npm install`, use the `--no-bin-links` switch to avoid issues


## General Troubleshooting
1. Run `vagrant reload` to restart from the Vagrantfile

---
This repository was inspired by the [rails-dev-box](https://github.com/rails/rails-dev-box) repo used for Rails core development.
