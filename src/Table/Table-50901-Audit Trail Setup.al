table 50901 "Audit Trail Setup"
{
    Caption = 'Audit Trail Setup';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = ToBeClassified;
            TableRelation = "User Setup"."User ID";

        }
        field(2; "Employee ID"; Code[20])
        {
            Caption = 'Employee ID';
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";
        }
        field(3; Password; Text[20])
        {
            Caption = 'Password';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                ATS: Record "Audit Trail Setup";
            begin
                ATS.Reset();
                ATS.SetRange(Password, Rec.Password);
                IF ATS.FindFirst() then
                    Error('Given %1 password is already used,please define different password', rec.Password);
            end;
        }
    }
    keys
    {
        key(PK; "User ID", "Employee ID")
        {
            Clustered = true;
        }
    }
}
