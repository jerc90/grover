CREATE OR REPLACE FUNCTION calculate_days (date1 in date)    
    RETURN number
    IS
    num_days integer;    
    BEGIN    
        num_days := CURRENT_DATE - date1;
        return num_days;
    END;