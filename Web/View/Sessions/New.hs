module Web.View.Sessions.New where

import Web.View.Prelude
import IHP.AuthSupport.View.Sessions.New

instance View (NewView User) where
    html NewView { .. } = [hsx|
        <main class="form-signin m-auto" style="max-width: 330px">
            { renderForm user }
        </main>
    |]

renderForm :: User -> Html
renderForm user = [hsx|
    <form method="POST" action={ CreateSessionAction }>
        <h1 class="h3 mb-3 fw-normal">Please sign in</h1>
        <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <input name="email" type="email" class="form-control" value={ get #email user }>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input name="password" type="password" class="form-control">
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
|]
