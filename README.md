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
4. Run `vagrant up`
  - This may take several minutes to complete

Once these steps are complete, you will have a fully working Linux environment for your code.


## Usage

Your projects will live in the `projects` subfolder of `fed-dev-box`. To get started you'll need to fire up your Vagrant box and connect to it.

### Creating a new project

1. In the root folder of `fed-dev-box` run `vagrant ssh`
2. When it connects, switch into the projects folder with `cd projects`
3. Run `yo bitmaker` to generate a new project
  - Follow the prompts to customize your projects to your needs
4. Once the generator is finished, switch into your new project directory (`cd my-project`)
5. Run `grunt` to start watching your files for changes
6. Switch over to Sublime Text and open your project folder via `File -> Open`
7. Open your web browser to `http://localhost:9000` to see the changes as you make them
8. To terminate the grunt task, press `ctrl + c`
9. Type `exit` to get out of Vagrant
10. Run `vagrant suspend` to finish your session with Vagrant 

### Working on existing projects

1. In the root folder of `fed-dev-box` run `vagrant up`
2. Next, run `vagrant ssh`
3. When it connects, switch into the projects folder with `cd projects`
4. Switch into your project directory (`cd my-project`)
5. Run `grunt` to start watching your files for changes
6. Switch over to Sublime Text and open your project folder via `File -> Open`
7. Open your web browser to `http://localhost:9000` to see the changes as you make them
8. To terminate the grunt task, press `ctrl + c`
9. Type `exit` to get out of Vagrant
10. Run `vagrant suspend` to finish your session with Vagrant 

---
This repository was inspired by the [rails-dev-box](https://github.com/rails/rails-dev-box) repo used for Rails core development.
