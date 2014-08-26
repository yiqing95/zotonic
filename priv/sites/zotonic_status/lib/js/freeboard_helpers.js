/*
 * Helper functions to convert erlang/zotonic values.
 */

function load_avg(avg)
{
        return (avg/256).toFixed(1)
}

function Gb(val)
{
        return (val / 1073741824).toFixed(1);
}


function Mb(val)
{
        return (val / 1048576).toFixed(1);
}
