module Web.View.Sessions.New where

import Web.View.Prelude
import IHP.AuthSupport.View.Sessions.New

instance View (NewView User) where
    beforeRender view = do
        setLayout loginLayout

    html NewView { .. } = [hsx|
        <main class="form-signin m-auto" style="max-width: 330px">
            { renderForm user }
        </main>
    |]

renderForm :: User -> Html
renderForm user = [hsx|
    <div class="form-signin">
        <form method="POST" action={ CreateSessionAction }>
            <div class="mb-3">
                <label for="email" class="form-label">Username</label>
                <input name="email" type="email" class="form-control" value={ get #email user }>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input name="password" type="password" class="form-control">
            </div>
            <button type="submit" class="w-100 btn btn-lg btn-primary">Enter</button>
        </form>
    </div>
|]
