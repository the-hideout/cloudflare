### ๐ Thanks for opening a pull request!

If you are new, please check out the [deployment process](https://github.com/the-hideout/cloudflare#deployment-) to understand how to deploy this pull request. A trimmed down summary will be listed below:

1. ๐งช Run a noop deployment with `.deploy noop` as a comment on this PR
1. ๐ Observe the CI and `noop` output on this pull request to ensure it is passing and doing what it is supposed to do
1. โ๏ธ Obtain an approval/review on this pull request
1. ๐ Branch deploy your pull request to production - [example](https://github.com/the-hideout/cloudflare/pull/11)

    > Comment `.deploy` on this pull request to trigger a deploy. If anything goes wrong, rollback with `.deploy main`

1. ๐ Merge!
