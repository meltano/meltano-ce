# Community Edition of the Meltano Platform (Beta!)

Maintained by: [Meltano](https://www.meltano.com/)

[Documentation](https://www.meltano.com/docs/) and [API reference](https://www.meltano.com/docs/api/)

Where to get help: the [Matatika Community Slack](https://join.slack.com/t/matatika/shared_invite/zt-19n1bfokx-F31DNitTpSxWCFO2aFlgxg)


## What is Meltano Community Edition?

[Meltano](https://www.meltano.com/) is a cloud-native data platform with CLI, API, and UI access for all.  We have integrated dbt, Meltano, and other open source technologies into a ready-to-run modern data stack.  [Read more](https://www.meltano.com/docs/concepts). 

This Community Edition is an all in one docker compose solution, and has been provided to help companies run their own solution where BOTH data engineers manage everything as code and data analysts manage data through a UI.

***NB - this is a beta release!  This edition is currently ready for beta users and would love your feedback.***


## How to get started

By installing this package you agree to the terms of our [community license](https://github.com/Matatika/matatika-docs/blob/master/CE-Licence.md).

***NB - The beta release of the Community Edition is currently only developed to work with Linux and macOS***

1. Install

   ```
   git clone https://github.com/Matatika/matatika-ce
   cd matatika-ce
   export userID=$(id -u); export groupID=$(id -g)
   docker-compose up
   ```
   In order to persist the userID and groupID variables, please add those to your .bashrc profile.
   To always be up to date with our latest changes, make sure that you run git pull to update your code from matatika-ce repository.


2. Register, login and create your first workspace

   https://localhost:3443

   Your workspaces will be created in `./workspaces` by default.  Configure this with `MATATIKA_WORKSPACES_HOME` in your docker-compose.yml


3. Configure your first pipeline

   Install `analyze-github` plugin and supply mandatory settings.

   Available plugins can be found in `./plugins` by default.  Configure this with `MATATIKA_PLUGINS_HOME` in your docker-compose.yml


4. Running your pipelines

   `analyze-github` is supplied with a default pipeline to import your data and some default datasets.


5. Share your data with the App or API

   Create new datasets in `[your-workspace]/analyze/datasets`

## Running Meltano-CE in cloud
Checkout our guide to running Meltano CE on a VM in your cloud [here](./cloud_config#readme).
