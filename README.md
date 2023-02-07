# dotfiles
Welcome to my world! Here are configuration files for neovim plugins based on dark powered made by [Shougo](https://github.com/Shougo). I hope you find something useful in these dotfiles. So take a look around and feel free to borrow, modify, or fork to get the dark power.

<img src="https://raw.githubusercontent.com/tamago3keran/images/main/dotfiles/image_01.png">

## Screenshots

|splash screen|editing code|filer UI|
|:--:|:--:|:--:|
|<img src="https://raw.githubusercontent.com/tamago3keran/images/main/dotfiles/image_02.png">|<img src="https://raw.githubusercontent.com/tamago3keran/images/main/dotfiles/image_03.png">|<img src="https://raw.githubusercontent.com/tamago3keran/images/main/dotfiles/image_04.png">|

## About
There are some branches in this repository. Each branch has dotfiles, with different functionality.

|Branch|Function|
|:--:|:--|
|base|neovim plugins|
|dotfiles|neovim plugins + LSP ( Vim script )
|react|neovim plugins + LSP ( ESLint, TypeScript Language Server )|
|ruby|neovim plugins + LSP ( Ruby )

## Setup
I usually use a MacBook. And I use Docker for development. So the following setup assumes that you are using Docker on a MacBook.

### iTerm2
The dotfiles are not displayed properly with Terminal.app which is installed by default on Mac. So I recommend using iTerm2. Please download iTerms2 on [the Website](https://iterm2.com).

### NERD FONTS
Download the [NERD FONTS](https://www.nerdfonts.com) of your choice to display 'iconic fonts' on iTerm2. After downloaded, move the font files to the `/Users/:UserName/Library/Fonts` directory. And then, set the downloaded font to Non-ASCII Font in iTerm2.

### Docker
First, please install [Docker Desktop for Mac](https://docs.docker.com/desktop/install/mac-install/).

I have created [the Docker image](https://hub.docker.com/repository/docker/tamago3keran/dotfiles/tags?name=neovim) that incorporates these dotfiles. This Docker image is based on [the Dockerfile](https://github.com/tamago3keran/Dockerfiles/blob/master/neovim/Dockerfile).

So after installing Docker, run the following command to pull the Docker image.

```bash
> docker pull tamago3keran/dotfiles:neovim
```

Finally, run command of `docker run` based on the pulled the Docker image.

```bash
> docker run --name neovim -it tamago3keran/dotfiles:neovim
```

## Note
### Case: Mac with Apple silicon
When you run docker run command on Mac with Apple silicon, please you specified the platform option.

```bash
> docker run --name neovim --platform linux/amd64 -it tamago3keran/dotfiles:neovim
```
