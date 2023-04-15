# Google Cloud Platform Playground

Me just messing around with GCP and various things.

Goal:

+ Make sure I have some kind of _personal_ reference for building and using
  GCP so that, should I leave Google, I can do similar things from scratch.

Items:

+ [ ] IAM: Create some kind of service account for code to upload things to GCP.
+ [ ] Cloud logging is a big one.
+ [ ] Upload to GCS
+ [ ] PubSub GCS & Cloud Functions
+ [ ] Cloud Function: trigger on GCS file, write data to database.
+ [ ] Perhaps upload to Drive
+ [ ] Protobuf

Perhaps do most of the above with Terraform, too. Partially to learn TF, partially
so that I can tear down everything and not get billed 😉.


## Terraform

### Installing

See [the official docs][tf-install], but the TL;DR is:

1.  Install some prereqs:
    ```shell
    sudo apt update && sudo apt install -y gnupg software-properties-common
    ```
1.  Install the Hashicorp GPG key:
    ```shell
    wget -O- https://apt.releases.hashicorp.com/gpg | \
    gpg --dearmor | \
    sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
    ```
1.  Add the Hashicorp repo:
    ```shell
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
    https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
    sudo tee /etc/apt/sources.list.d/hashicorp.list
    ```
1.  Install
    ```shell
    sudo apt update && sudo apt install terraform
    ```
1.  Install tab completion
    ```shell
    terraform -install-autocomplete
    ```

[tf-install]: https://developer.hashicorp.com/terraform/tutorials/gcp-get-started/install-cli
