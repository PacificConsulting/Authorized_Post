page 50901 "Audit Trail Setup"
{
    ApplicationArea = All;
    Caption = 'Audit Trail Setup';
    PageType = List;
    SourceTable = "Audit Trail Setup";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("User ID"; Rec."User ID")
                {
                    ToolTip = 'Specifies the value of the User ID field.';
                }
                field("Employee ID"; Rec."Employee ID")
                {
                    ToolTip = 'Specifies the value of the Employee ID field.';
                }
                field(Password; Rec.Password)
                {
                    ToolTip = 'Specifies the value of the Password field.';
                }
            }
        }
    }

}
