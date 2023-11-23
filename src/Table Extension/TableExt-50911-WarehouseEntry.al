tableextension 50911 WarehouseENtryExt extends "Warehouse Entry"
{
    fields
    {
        field(50901; "Posted By"; Text[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }

    }

    var
        myInt: Codeunit 7301;
}