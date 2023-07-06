pageextension 50923 "G/L Register Ext" extends "G/L Registers"
{
    layout
    {
        addafter("User ID")
        {

            field("Posted By"; Rec."Posted By")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Posted By field.';
            }
        }
    }
}
