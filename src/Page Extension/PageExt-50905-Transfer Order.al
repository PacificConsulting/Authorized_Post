pageextension 50905 TransferOrderExt extends "Transfer Order"
{
    layout
    {
        // Add changes to page layout here//
    }

    actions
    {
        modify(Post)
        {
            trigger OnBeforeAction()
            var
                PageConfirmation: Page "Password Detail";
                Employee: Record Employee;
                ATS: Record "Audit Trail Setup";
                GlSetup: Record "General Ledger Setup";
            Begin
                GlSetup.Get();
                IF GlSetup."Password Posting" then begin
                    Clear(PageConfirmation);
                    PageConfirmation.LookupMode(true);
                    if PageConfirmation.RunModal() = Action::LookupOK then begin
                        CurrentPassword := PageConfirmation.ReturnPassword();
                        ATS.Reset();
                        ATS.SetRange("User ID", UserId);
                        ATS.SetRange(Password, CurrentPassword);
                        IF not ATS.FindFirst() then
                            Error('Given password is wrong or setup is missing');

                        Rec."Posted By" := ATS."Employee ID";
                        Rec.Modify();
                    end Else
                        Error('Please enter the password for Posting.');
                end;
            end;

        }
    }

    var
        myInt: Integer;
        Posted_User: Code[20];
        CurrentPassword: Text[20];
        Posted_Name: Text[30];
}