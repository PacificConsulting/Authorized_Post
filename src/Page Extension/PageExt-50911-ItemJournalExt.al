pageextension 50911 ItemJournalExt extends "Item Journal"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        modify(Post)
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
                        ItemJnlLine.Reset();
                        ItemJnlLine.SetRange("Document No.", Rec."Document No.");
                        if ItemJnlLine.FindSet() then
                            repeat
                                ItemJnlLine."Posted By" := ATS."Employee ID";
                                ItemJnlLine.Modify();
                            until ItemJnlLine.Next() = 0;
                    end Else
                        Error('Please enter the password for Posting.');
                end;
            end;
        }
    }

    var
        myInt: Integer;
        CurrentPassword: Text[250];
        ItemJnlLine: Record "Item Journal Line";

}