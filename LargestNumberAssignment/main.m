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


int main(int argc, const char * argv[]) {
    @autoreleasepool {

        NSArray* array1 = @[@3, @7, @6, @8];
        
        NSArray* array2 = @[@44, @5, @6];
        
        NSArray* array3 = @[];
        
        NSArray* array4 = @[@11.999999, @2.8, @4.5, @-101.2, @12.0, @M_1_PI];
        
        NSArray* array5 = @[ @34, @34.1 ];
        
        NSArray* array6 = [array1 arrayByAddingObjectsFromArray: array2];

        // No type checking is explicitly performed but NSString will work as well as
        // NSNumber.  Mixed-type arrays with strings and numbers will cause an exception.
        NSArray* array7 = @[@"one", @"hello", @"twentythree", @"HELLO"];

        int indexOfLargest = GetIndexOfLargest(array1);
        if (indexOfLargest > -1)
            NSLog(@"Largest item in array 1 is %@ at index %d.", array1[indexOfLargest], indexOfLargest);
        else
            NSLog(@"Array 1 is empty and has no largest value");
        
        indexOfLargest = GetIndexOfLargest(array2);
        if (indexOfLargest > -1)
            NSLog(@"Largest item in array 2 is %@ at index %d.", array2[indexOfLargest], indexOfLargest);
        else
            NSLog(@"Array 2 is empty and has no largest value");

        indexOfLargest = GetIndexOfLargest(array3);
        if (indexOfLargest > -1)
            NSLog(@"Largest item in array 3 is %@ at index %d.", array3[indexOfLargest], indexOfLargest);
        else
            NSLog(@"Array 3 is empty and has no largest value.");
    
        indexOfLargest = GetIndexOfLargest(array4);
        if (indexOfLargest > -1)
            NSLog(@"Largest item in array 4 is %@ at index %d.", array4[indexOfLargest], indexOfLargest);
        else
            NSLog(@"Array 4 is empty and has no largest value.");
        
        indexOfLargest = GetIndexOfLargest(array5);
        if (indexOfLargest > -1)
            NSLog(@"Largest item in array 5 is %@ at index %d.", array5[indexOfLargest], indexOfLargest);
        else
            NSLog(@"Array 5 is empty and has no largest value.");
        
        indexOfLargest = GetIndexOfLargest(array6);
        if (indexOfLargest > -1)
            NSLog(@"Largest item in array 6 is %@ at index %d.", array6[indexOfLargest], indexOfLargest);
        else
            NSLog(@"Array 6 is empty and has no largest value.");
        
        indexOfLargest = GetIndexOfLargest(array7);
        if (indexOfLargest > -1)
            NSLog(@"Largest item in array 7 is %@ at index %d.", array7[indexOfLargest], indexOfLargest);
        else
            NSLog(@"Array 7 is empty and has no largest value.");
        
        NSLog(@"Largest value by sorting: %@", GetLargestValueBySorting(array1));
        NSLog(@"Largest value by sorting: %@", GetLargestValueBySorting(array2));
        NSLog(@"Largest value by sorting: %@", GetLargestValueBySorting(array3));
        NSLog(@"Largest value by sorting: %@", GetLargestValueBySorting(array4));
        NSLog(@"Largest value by sorting: %@", GetLargestValueBySorting(array5));
        NSLog(@"Largest value by sorting: %@", GetLargestValueBySorting(array7));
    
    }
    return 0;
}
