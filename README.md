# Dynamic Profile Page On GitHub

A GitHub action to push updates to your special profile repo.

### Why?

GitHub announced a special repository (github_username/github_username) so that its README.md file will appear on your profile page. People liked it a lot and started using some static pages with fancy texts and images. This GitHub action helps you to add a section that is updated dynamically when you commit a repository that uses this action. A line per repository is added to the section and the lines are ordered from the newest to the oldest. You can see a sample execution in [my profile page](https://github.com/umutphp).

![Sample Profile Page](./assets/github_profile_sample.png)

Please feel free to fork it or contribute to it.

## Usage

You can add this action to any repository other than profile repository (special repository). This action will add a line for every repository (that the action is activated) to the README file of the special repository.

Follow the steps;
- Create your special repository if not exists.
- Add `<!-- START gadpp -->` add the end of the README.md file of the special repo.
- Create a personal access token [here](https://github.com/settings/tokens) and set the `repo` permission.
- Add the access token created in previous step to the repository (that uses this action) as a secret with name `API_TOKEN_GITHUB`.
- Create the YML file for the action under `.github/workflows` of the repository (the one which is not the special repository). You can use the sample given below. Please update `YOUR_GITHUB_USERNAME` and `EMAIL_USED_ON_GITHUB` values.
- Please do not forget to add checkout step before GADPP step in your pipeline.

## Example YML File To Create A Workflow With This Action

```yml
name: Update GitHub Profile Page
on: [push]

jobs:
  gadpp_job:
    runs-on: ubuntu-latest
    name: Update GitHub Profile Page
    steps:
      - name: Checkout
        uses: actions/checkout@v2
      - name: GADPP
        uses: umutphp/github-action-dynamic-profile-page@v5
        id: gadpp
        env:
          API_TOKEN_GITHUB: ${{ secrets.API_TOKEN_GITHUB }}
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        with:
          github-username: 'YOUR_GITHUB_USERNAME'
          user-email: 'EMAIL_USED_ON_GITHUB'

```

### Users using this action 

- [Awesome CLI](https://github.com/umutphp/awesome-cli)
- [Hacker Laws TR](https://github.com/umutphp/hacker-laws-tr)
- [Github Stats](https://github.com/umutphp/github-stats)
- [Famous Bugs](https://github.com/umutphp/famous-bugs)
- [PHP Docker Images for CLI](https://github.com/umutphp/php-docker-images-for-cli)
- [Larvel Model Recommendation](https://github.com/umutphp/larvel-model-recommedation)
- [LuckKAnn](https://github.com/LuckKAnn/LuckKAnn)
- [Vvroul](https://github.com/vvroul/vvroul)
- [Waka Box](https://github.com/joriewong/waka-box)
- [Diablo Music App](https://github.com/Suvraneel/diablo-music-app)
- [Diablo Music](https://github.com/Suvraneel/diablo-music)
- [C Programming](https://github.com/Suvraneel/C-programming)
- [B Buck Offical](https://github.com/david3239294/BBUCKOffical)
- [Baby Buck](https://github.com/david329294/babybuck)
- [Sandep-FED](https://github.com/Sandeep-FED)
- [7-TE](https://github.com/7-TE/7-TE)
- [Go Go Richie](https://github.com/gogorichie/gogorichie)
- [TheRakeshPurohit](https://github.com/TheRakeshPurohit/awesome-cli)
- [Dotfiles](https://github.com/dat-adi/dotfiles)
- [Tiny App](https://github.com/dat-adi/tinyApps)
- [Time Tabler](https://github.com/dat-adi/time-tabler)
- [Eisen Tickets](https://github.com/dat-adi/eisen-tickets)

Please add a issue if you don't see your name on here, And We will add it.
