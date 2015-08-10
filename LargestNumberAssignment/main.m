//
//  main.m
//  LargestNumberAssignment
//
//  Methods that demonstrate how to extract the largest
//  item from an array of numbers.
//
//  Created by asu on 2015-07-20.
//  Copyright (c) 2015 asu. All rights reserved.
//

#import <Foundation/Foundation.h>


// GetIndexOfLargest
//
// Return the index of the largest item in an array of numbers.
// Uses an explicit loop to traverse the array.
// Ties are not considered.
//
// Parameters:
// array - the array of values to evaluate.  Entries are expected
//         to be of type NSNumber but no explicit enforcement or
//         type checking is performed.
//
int GetIndexOfLargest(NSArray* array){
    if (nil == array || [array count] < 1)
        return -1;
    
    int largest = 0;
    for (int i = 0; i < [array count]; i++ ){
        
        // Using "<" can sometimes cause undefined results.
        // use isGreaterThan
        if ([array[i] isGreaterThan: array[largest]]) {
            largest = i;
        }
        
    }
    
    return largest;
}


// GetLargestValueBySorting
//
// Sort the given array in descending order then return the first
// value.
//
// Parameters:
// array - the array of values to evaluate.  Entries are expected
//         to be of type NSNumber but no explicit enforcement or
//         type checking is performed.
//
id GetLargestValueBySorting(NSArray* array){
    if (nil == array || [array count] < 1)
        return nil;
    NSArray* sorted = [array sortedArrayUsingSelector:@selector(isLessThan:)];
    return sorted[0];
}


void TestArray(NSArray* array, NSString* testName){

    NSLog(@"Test: %@", testName);

    int indexOfLargest = GetIndexOfLargest(array);
    if (indexOfLargest > -1)
        NSLog(@"Largest item is %@ at index %d.", array[indexOfLargest], indexOfLargest);
    else
        NSLog(@"Array is empty and has no largest value");

    NSLog(@"Largest value by sorting: %@", GetLargestValueBySorting(array));

    NSLog(@"\n\n\n");

    
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        NSArray* array1 = @[@3, @7, @6, @8];
        
        NSArray* array2 = @[@44, @5, @6];
        
        NSArray* emptyArray = @[];
        
        NSArray* oneItemArray = @[ @9 ];
        
        NSArray* floatArray = @[@11.999999, @2.8, @4.5, @-101.2, @12.0, @M_1_PI];
        
        NSArray* floatAndIntArray = @[ @34, @34.1, @29, @29.8 ];
        
        NSArray* concatenatedArray = [array1 arrayByAddingObjectsFromArray: array2];

        // No type checking is explicitly performed but NSString will work as well as
        // NSNumber.  Mixed-type arrays with strings and numbers will cause an exception.
        NSArray* stringArray = @[@"one", @"hello", @"twentythree", @"HELLO"];

        TestArray(array1, @"Array 1");
        TestArray(array2, @"Array 2");
        TestArray(emptyArray, @"empty array");
        TestArray(oneItemArray, @"single item");
        TestArray(floatArray, @"floats");
        TestArray(floatAndIntArray, @"floats and ints");
        TestArray(concatenatedArray, @"Concatenated Array");
        TestArray(stringArray, @"String Array");
        

        
    }
    return 0;
}
