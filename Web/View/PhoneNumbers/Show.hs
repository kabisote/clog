module Web.View.PhoneNumbers.Show where
import Web.View.Prelude
import Web.View.Prelude (PhoneNumber'(doNotCall, territoryId), Call' (phoneNumberId))

data ShowView = ShowView { phoneNumber :: Include "calls" PhoneNumber }

instance View ShowView where
    html ShowView { .. } = [hsx|
        <h1 class="mb-4 pt-4">0{ get #phoneNumber phoneNumber }</h1>
        <dl class="row">
            <dt class="col-sm-2">Source</dt>
            <dd class="col-sm-10">{ get #source phoneNumber}</dd>

            <dt class="col-sm-2">Do not call</dt>
            <dd class="col-sm-10">{ get #doNotCall phoneNumber}</dd>
        </dl>
        <p>
            <a class="btn btn-secondary mr-4" href={ ShowTerritoryAction (get #territoryId phoneNumber) }>Back to Territory</a>
            <a href={EditPhoneNumberAction (get #id phoneNumber)} class="text-muted">Edit</a>
            |
            <a href={DeletePhoneNumberAction (get #id phoneNumber)} class="js-delete text-muted">Delete</a>
        </p>
        <hr />
        <h3 class="my-4">Records</h3>
        <p><a href={ NewCallAction  (get #id phoneNumber) } class="btn btn-primary">Add Record</a></p>
        <div>{ forEach (get #calls phoneNumber) renderCall }</div>

    |]
        where
            breadcrumb = renderBreadcrumb
                            [ breadcrumbLink "PhoneNumbers" PhoneNumbersAction
                            , breadcrumbText "Show PhoneNumber"
                            ]

            renderCall call = [hsx|
                <dl class="row shadow-sm p-3 mb-5 bg-body rounded">
                    <dt class="col-sm-2">Publisher(s)</dt>
                    <dd class="col-sm-10">{ get #agents call }</dd>

                    <dt class="col-sm-2">When Called</dt>
                    <dd class="col-sm-10">{ get #createdAt call |> timeAgo }</dd>

                    <dt class="col-sm-2">Remarks</dt>
                    <dd class="col-sm-10">{ get #remarks call }</dd>
                </dl>
            |]
