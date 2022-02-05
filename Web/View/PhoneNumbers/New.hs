module Web.View.PhoneNumbers.New where
import Web.View.Prelude
import Web.View.Prelude (FormField(autofocus))

data NewView = NewView { phoneNumber :: PhoneNumber
                       , territory :: Territory 
                       }

instance View NewView where
    html NewView { .. } = [hsx|
        {breadcrumb}
        <h1>New Phone Number for <q>{ get #name territory }</q></h1>
        {renderForm phoneNumber}
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "Territories" TerritoriesAction
                , breadcrumbText "New Phone Number"
                ]

renderForm :: PhoneNumber -> Html
renderForm phoneNumber = formFor phoneNumber [hsx|
    {(textField #phoneNumber) { autofocus = True }}
    {(textField #source)}
    {(hiddenField #territoryId)}
    {(checkboxField #doNotCall)}
    {submitButton { label = "Create Phone Number" }}

|]
