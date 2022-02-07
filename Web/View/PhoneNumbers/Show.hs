module Web.View.PhoneNumbers.Show where
import Web.View.Prelude

data ShowView = ShowView { phoneNumber :: PhoneNumber }

instance View ShowView where
    html ShowView { .. } = [hsx|
        {breadcrumb}
        <h1>Show PhoneNumber</h1>
        <p>{phoneNumber}</p>
        <p><a class="btn btn-primary" href={NewCallAction (get #id phoneNumber)}>Add Call Record</a></p>

    |]
        where
            breadcrumb = renderBreadcrumb
                            [ breadcrumbLink "PhoneNumbers" PhoneNumbersAction
                            , breadcrumbText "Show PhoneNumber"
                            ]
