module Web.View.Layout (defaultLayout, Html) where

import IHP.ViewPrelude
import IHP.Environment
import qualified Text.Blaze.Html5            as H
import qualified Text.Blaze.Html5.Attributes as A
import Generated.Types
import IHP.Controller.RequestContext
import Web.Types
import Web.Routes
import Application.Helper.View
import Network.HTTP.Media (RenderHeader(renderHeader))

defaultLayout :: Html -> Html
defaultLayout inner = H.docTypeHtml ! A.lang "en" $ [hsx|
<head>
    {metaTags}

    {stylesheets}
    {scripts}

    <title>{pageTitleOrDefault "App"}</title>
</head>
<body>
    {renderNavBar}
    <div class="container mt-4">
        {renderFlashMessages}
        {inner}
    </div>
</body>
|]

renderNavBar :: Html
renderNavBar = [hsx|
   <header class="p-3 bg-dark text-white">
    <div class="container">
      <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
        <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 mr-2 text-white text-decoration-none">
        Home
        </a>

        <ul class="nav col-12 col-lg-auto mr-auto mb-2 justify-content-center mb-md-0">
            {showLinks}
        </ul>

        <div class="text-end">
            {showLoginLogout}
        </div>
      </div>
    </div>
  </header> 
|]
    where
        showLinks =
            case currentUserOrNothing of
                Just currentUser -> [hsx|
                    <li><a href={TerritoriesAction} class="nav-link px-2 text-white">Territories</a></li>
                    <li><a href={UsersAction} class="nav-link px-2 text-white">Users</a></li>
                |]

                Nothing -> [hsx||]

        showLoginLogout =
            case currentUserOrNothing of
                Just currentUser -> [hsx|<a class="js-delete js-delete-no-confirm btn btn-warning" href={DeleteSessionAction}>Logout</a>|]
                Nothing          -> [hsx|<a class="btn btn-warning" href={NewSessionAction}>Login</a>|]


-- The 'assetPath' function used below appends a `?v=SOME_VERSION` to the static assets in production
-- This is useful to avoid users having old CSS and JS files in their browser cache once a new version is deployed
-- See https://ihp.digitallyinduced.com/Guide/assets.html for more details

stylesheets :: Html
stylesheets = [hsx|
        <link rel="stylesheet" href={assetPath "/vendor/bootstrap.min.css"}/>
        <link rel="stylesheet" href={assetPath "/vendor/flatpickr.min.css"}/>
        <link rel="stylesheet" href={assetPath "/app.css"}/>
    |]

scripts :: Html
scripts = [hsx|
        {when isDevelopment devScripts}
        <script src={assetPath "/vendor/jquery-3.6.0.slim.min.js"}></script>
        <script src={assetPath "/vendor/timeago.js"}></script>
        <script src={assetPath "/vendor/popper.min.js"}></script>
        <script src={assetPath "/vendor/bootstrap.min.js"}></script>
        <script src={assetPath "/vendor/flatpickr.js"}></script>
        <script src={assetPath "/vendor/morphdom-umd.min.js"}></script>
        <script src={assetPath "/vendor/turbolinks.js"}></script>
        <script src={assetPath "/vendor/turbolinksInstantClick.js"}></script>
        <script src={assetPath "/vendor/turbolinksMorphdom.js"}></script>
        <script src={assetPath "/helpers.js"}></script>
        <script src={assetPath "/ihp-auto-refresh.js"}></script>
        <script src={assetPath "/app.js"}></script>
    |]

devScripts :: Html
devScripts = [hsx|
        <script id="livereload-script" src={assetPath "/livereload.js"} data-ws={liveReloadWebsocketUrl}></script>
    |]

metaTags :: Html
metaTags = [hsx|
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta property="og:title" content="App"/>
    <meta property="og:type" content="website"/>
    <meta property="og:url" content="TODO"/>
    <meta property="og:description" content="TODO"/>
    {autoRefreshMeta}
|]
