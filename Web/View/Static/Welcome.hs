module Web.View.Static.Welcome where
import Web.View.Prelude
import IHP.AuthSupport.View.Sessions.New

data WelcomeView = WelcomeView

instance View WelcomeView where
    beforeRender view = do
        setLayout loginLayout

    html WelcomeView = [hsx|
            <main class="text-center text-light">
                <!--
                <h1>Hi</h1>
                <p class="lead">The quick brown fox jumps over the lazy dog.</p>
                -->
                <p class="lead">
                    {if isLoggedIn then showLogout else showLogin}
                </p>
            </main>
        |]
        where
            isLoggedIn = isJust currentUserOrNothing

            showLogin :: Html
            showLogin = [hsx|<a href={NewSessionAction} class="btn btn-lg btn-warning fw-bold">Enter</a>|]
                  

            showLogout :: Html
            showLogout = [hsx|<a href={DeleteSessionAction} class="js-delete js-delete-no-confirm btn btn-lg btn-warning fw-bold">Exit</a>|]

