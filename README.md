Boris_Bikes
===========

This is a second attempt at Boris Bikes and supercedes the previous Boris Bikes repository

This code models the London Boris Bikes system.

The project assumes the following:

Each bike can be in one of two conditions working or broken. Only working bikes can be rented from a docking station. Broken bikes must not be released to customers. Broken bikes can be released to vans. Customers are only able to dock the bike if the docking station has not reached capacity. Vans are able to fill empty docking stations with working bikes (not broken bikes)

Technologies utilised

Ruby - The task focuses on the use of class + instance methods and variables. Objects retain their state eg. when an instance of a bike is broken it cannot be released to a customer.

Rspec - Introduction to stubbing and mocking. Testing classes individually.
