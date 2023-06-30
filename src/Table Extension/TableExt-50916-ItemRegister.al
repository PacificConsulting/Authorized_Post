tableextension 50916 ItemRegisterExt extends "Item Register"
{
    fields
    {
        field(50901; "Posted By"; Code[10])
        {
            Caption = 'Posted By';
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    var
        myInt: Integer;
}