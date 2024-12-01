\* supply-demand-minimize-costs-problem *\
Minimize
OBJ: 8 x_11 + 18 x_12 + 14 x_13 + 40 x_14 + 40 x_15 + 25 x_16 + 12 x_21
 + 10 x_22 + 8 x_23 + 18 x_24 + 40 x_25 + 18 x_26 + 34 x_31 + 32 x_32
 + 30 x_33 + 10 x_34 + 33 x_35 + 35 x_36 + 25 x_41 + 20 x_42 + 18 x_43
 + 35 x_44 + 30 x_45 + 10 x_46
Subject To
Country_demand_constraints_0: x_11 + x_21 + x_31 + x_41 >= 40000
Country_demand_constraints_1: x_12 + x_22 + x_32 + x_42 >= 15000
Country_demand_constraints_2: x_13 + x_23 + x_33 + x_43 >= 25000
Country_demand_constraints_3: x_14 + x_24 + x_34 + x_44 >= 45000
Country_demand_constraints_4: x_15 + x_25 + x_35 + x_45 >= 25000
Country_demand_constraints_5: x_16 + x_26 + x_36 + x_46 >= 25000
Warehouse_supply_constraints_0: x_11 + x_12 + x_13 + x_14 + x_15 + x_16
 <= 50000
Warehouse_supply_constraints_1: x_21 + x_22 + x_23 + x_24 + x_25 + x_26
 <= 30000
Warehouse_supply_constraints_2: x_31 + x_32 + x_33 + x_34 + x_35 + x_36
 <= 40000
Warehouse_supply_constraints_3: x_41 + x_42 + x_43 + x_44 + x_45 + x_46
 <= 55000
Bounds
 0 <= x_11
 0 <= x_12
 0 <= x_13
 0 <= x_14
 0 <= x_15
 0 <= x_16
 0 <= x_21
 0 <= x_22
 0 <= x_23
 0 <= x_24
 0 <= x_25
 0 <= x_26
 0 <= x_31
 0 <= x_32
 0 <= x_33
 0 <= x_34
 0 <= x_35
 0 <= x_36
 0 <= x_41
 0 <= x_42
 0 <= x_43
 0 <= x_44
 0 <= x_45
 0 <= x_46
Generals
x_11
x_12
x_13
x_14
x_15
x_16
x_21
x_22
x_23
x_24
x_25
x_26
x_31
x_32
x_33
x_34
x_35
x_36
x_41
x_42
x_43
x_44
x_45
x_46
End
