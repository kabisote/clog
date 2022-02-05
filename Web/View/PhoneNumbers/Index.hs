module Web.View.PhoneNumbers.Index where
import Web.View.Prelude

data IndexView = IndexView { phoneNumbers :: [PhoneNumber]  }

instance View IndexView where
    html IndexView { .. } = [hsx|
        {breadcrumb}

        <h1>Phone Numbers</h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>PhoneNumber</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach phoneNumbers renderPhoneNumber}</tbody>
            </table>
            
        </div>
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "PhoneNumbers" PhoneNumbersAction
                ]

renderPhoneNumber :: PhoneNumber -> Html
renderPhoneNumber phoneNumber = [hsx|
    <tr>
        <td>{phoneNumber}</td>
        <td><a href={ShowPhoneNumberAction (get #id phoneNumber)}>Show</a></td>
        <td><a href={EditPhoneNumberAction (get #id phoneNumber)} class="text-muted">Edit</a></td>
        <td><a href={DeletePhoneNumberAction (get #id phoneNumber)} class="js-delete text-muted">Delete</a></td>
    </tr>
|]
