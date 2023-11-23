tableextension 50902 GenJnlLineExt extends "Gen. Journal Line"
{
    fields
    {
        field(50901; "Posted By"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Staff Master".ID;
            Editable = false;
        }
    }

    var
        myInt: Integer;
}