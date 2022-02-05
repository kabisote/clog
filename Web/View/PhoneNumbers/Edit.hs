module Web.View.PhoneNumbers.Edit where
import Web.View.Prelude

data EditView = EditView { phoneNumber :: PhoneNumber }

instance View EditView where
    html EditView { .. } = [hsx|
        {breadcrumb}
        <h1>Edit PhoneNumber</h1>
        {renderForm phoneNumber}
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "PhoneNumbers" PhoneNumbersAction
                , breadcrumbText "Edit PhoneNumber"
                ]

renderForm :: PhoneNumber -> Html
renderForm phoneNumber = formFor phoneNumber [hsx|
    {(textField #phoneNumber)}
    {(textField #source)}
    {(textField #territoryId)}
    {(textField #doNotCall)}
    {submitButton}

|]