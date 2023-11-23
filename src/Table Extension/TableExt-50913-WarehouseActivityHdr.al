tableextension 50913 WAHExt extends "Warehouse Activity Header"
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