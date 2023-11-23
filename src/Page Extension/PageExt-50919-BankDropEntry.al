pageextension 50919 BanKDropEntryExt extends "Bank Drop Entry "
{
    layout
    {
        addafter(Status)
        {

            field("Posted By"; Rec."Posted By")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Posted By field.';
            }
        }
    }

    actions
    {
        modify("Create and Post Voucher")
        {
            trigger OnBeforeAction()
            var
                PageConfirmation: Page "Password Detail";
                Employee: Record Employee;
                UserSetup: Record "User Setup";
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
        CurrentPassword: Text[250];
        BankDropEntry: Record "Bank Drop Entry";
}