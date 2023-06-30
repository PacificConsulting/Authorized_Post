tableextension 50915 GLRegisterExt extends "G/L Register"
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