pageextension 50902 "General ledger Setup" extends "General Ledger Setup"
{
    layout
    {
        addafter("Exchange Batch")
        {

            field("Password Posting"; Rec."Password Posting")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Password Posting field.';
            }
        }
    }
}
