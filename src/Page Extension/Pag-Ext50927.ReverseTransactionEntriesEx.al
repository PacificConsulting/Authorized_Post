pageextension 50927 "Reverse Transaction Entries Ex" extends "Reverse Transaction Entries"
{
    layout
    {
        addafter(Description)
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

        modify(Reverse)
        {
            trigger OnBeforeAction()
            var
                PageConfirmation: Page "Password Detail";
                Employee: Record Employee;
                UserSetup: Record "User Setup";
                ATS: Record "Audit Trail Setup";
                GlSetup: Record "General Ledger Setup";
                RE: Record "Reversal Entry";
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
                        RE.Reset();
                        RE.SetRange("Entry No.", Rec."Entry No.");
                        RE.SetRange("Transaction No.", rec."Transaction No.");
                        IF RE.FindSet() then
                            repeat
                                RE."Posted By" := ATS."Employee ID";
                                RE.Modify();
                            until RE.Next() = 0;
                    end Else
                        Error('Please enter the password for Posting.');
                end;
            end;
        }
    }
    var
        myInt: Integer;
        CurrentPassword: Text[250];

}
