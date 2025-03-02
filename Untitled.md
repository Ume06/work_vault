# Gravity Model for Traffic Flow

The Gravity Model estimates the number of trips between an origin and a destination based on trip production, attraction, and travel cost.

## **Formula**
$$
T_{ij} = O_i \cdot A_j \cdot f(c_{ij})
$$`

where:

- **$` T_{ij} `$** = Number of trips from origin $` i `$ to destination $` j `$.
- **$` O_i `$** = Total trips produced at origin $` i `$.
- **$` A_j `$** = Attraction factor for destination $` j `$, calculated as:

  $$
  A_j = \frac{D_j}{\sum_j D_j}
  $$

  where **$` D_j `$** is the total trips arriving at destination $` j `$.

- **$` f(c_{ij}) `$** = Deterrence function that accounts for travel cost, typically an exponential decay function:

  $$
  f(c_{ij}) = e^{-\beta c_{ij}}
  $$

  where **$` \beta `$** is a parameter controlling the impact of travel cost **$` c_{ij} `$**.

## **Steps to Calculate Trips Distribution**
1. **Compute Attraction Factor** for each destination:

   $$
   A_j = \frac{D_j}{\sum_j D_j}
   $$

2. **Compute the Deterrence Function** using an exponential decay:

   $$
   f(c_{ij}) = e^{-\beta c_{ij}}
   $$

3. **Compute Unadjusted Trip Values** using the Gravity Model formula:

   $$
   T_{ij} = O_i \cdot A_j \cdot f(c_{ij})
   $$

4. **Normalize the Values** to ensure that total trips match the given origin trip production.

This model helps predict traffic flow patterns and is widely used in urban planning and transportation analysis.
