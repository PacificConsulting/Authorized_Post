pageextension 50902 "General ledger Setup" extends "General Ledger Setup"
{
    layout
    {
        addafter("Bank Account Nos.")
        {

            field("Password Posting"; Rec."Password Posting")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Password Posting field.';
            }
        }
    }
}
