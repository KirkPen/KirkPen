// License: Apache 2.0. See LICENSE file in root directory.
// Copyright(c) 2019 Intel Corporation. All Rights Reserved.

#include <librealsense2/rs.hpp> // Include RealSense Cross Platform API
#include <iostream>             // for cout
#include <map>
#include <string>
#include <thread>
#include <atomic>


class filter_options
{
public:
    filter_options(const std::string name, rs2::filter& filter);
    filter_options(filter_options&& other);
    std::string filter_name;                                   //Friendly name of the filter
    rs2::filter& filter;                                       //The filter in use
    //std::map<rs2_option, filter_slider_ui> supported_options;  //maps from an option supported by the filter, to the corresponding slider
    std::atomic_bool is_enabled;                               //A boolean controlled by the user that determines whether to apply the filter or not
};

// Declare filters
    rs2::decimation_filter dec_filter;  // Decimation - reduces depth frame density
    rs2::threshold_filter thr_filter;   // Threshold  - removes values outside recommended range
    rs2::spatial_filter spat_filter;    // Spatial    - edge-preserving spatial smoothing
    rs2::temporal_filter temp_filter;   // Temporal   - reduces temporal noise

bool runOnce = true;
float groundDist[640][480];
// Hello RealSense example demonstrates the basics of connecting to a RealSense device
// and taking advantage of depth data
int main(int argc, char * argv[]) try
{
    // Create a Pipeline - this serves as a top-level API for streaming and processing frames
    rs2::pipeline p;

    // Configure and start the pipeline
    p.start();
    
    

    while (true)
    {
        // Block program until frames arrive
        rs2::frameset frames = p.wait_for_frames();

        // Try to get a frame of a depth image
        rs2::depth_frame depth = frames.get_depth_frame();
        
        // Get the depth frame's dimensions
        const auto width = depth.get_width();
        const auto height = depth.get_height();
        rs2::frame filtered = depth;
        // Query the distance from the camera to the object in the center of the image
        float dist_to_center = depth.get_distance(width / 2, height / 2);
        std::vector<filter_options> filters;

        // The following order of emplacement will dictate the orders in which filters are applied
        filters.emplace_back("Decimate", dec_filter);
        filters.emplace_back("Threshold", thr_filter);
        //filters.emplace_back(disparity_filter_name, depth_to_disparity);
        filters.emplace_back("Spatial", spat_filter);
        filters.emplace_back("Temporal", temp_filter);

        for (auto&& filter : filters)
            {
                if (filter.is_enabled)
                {
                    filtered = filter.filter.process(filtered);
                    
                }
            }











        //filtered = filter.filter.process(filtered);

        int r, c;
        float dist[width][height], obstacle[width][height], diff = .1;
            
            for (r = 0; r < width; ++r)
            {
                for (c = 0; c < height - 1; ++c)
                {
                    dist[r][c] = depth.get_distance(r, c);
                }
            }

            if (runOnce)
            {
                for (r = 0; r < width; ++r)
                {
                    for (c = 0; c < height - 1; ++c)
                    {
                        
                        groundDist[r][c] = depth.get_distance(r, c);
                        
                        //Need to add filter to get solid ground dist with no 0's
                    }
                }
                
                runOnce = 0;
            }

            for (r = 0; r < width; ++r) 
            {
                for (c = 0; c < height - 1; ++c)
                {
                    if (dist[r][c] != 0)
                    {
                        if (dist[r][c] < (groundDist[r][c] - diff))
                            obstacle[r][c] = dist[r][c];
                    }
                }
            }

                /*
                For each line starting at the bottom left of frame, ignoring any zeros, compare each value to a known base value
                distance to the ground in front of truck and if it is less than that value by some amount, recored it in the obstacle array.
                
                Then look at obstacle to measure height and width. Figure out how many rows equals how much height at a certan row. If over
                limit for height and width, turn to avoid it. Check that path around is clear with same method.
                Then tell arduino to turn to avoid it. Turn camera to steering angle to check new path around obstacle. Arduino 
                watches distance to side with VL5310X to tell arduino when obstacle is no longer next to it. Then turn back on
                course.

                */
            

            // Print the distance

            for (r = 0; r < width; ++r)
            {

                for (c = 0; c < height - 1; ++c)
                {
                    if (obstacle[r][c] != 0)
                    {
                       printf("The camera is facing an object %.3f meters away at width = %d and height = %d\n", obstacle[r][c], r, c);
                    }
                }
            }

            for (r = 0; r < width; ++r)
            {
                for (c = 0; c < height - 1; ++c)
                {
                    obstacle[r][c] = 0;
                }
            }


        // Print the distance
        std::cout << "The camera is facing an object " << dist_to_center << " meters away \r";
    }

    return EXIT_SUCCESS;
}
catch (const rs2::error & e)
{
    std::cerr << "RealSense error calling " << e.get_failed_function() << "(" << e.get_failed_args() << "):\n    " << e.what() << std::endl;
    return EXIT_FAILURE;
}
catch (const std::exception& e)
{
    std::cerr << e.what() << std::endl;
    return EXIT_FAILURE;
}
