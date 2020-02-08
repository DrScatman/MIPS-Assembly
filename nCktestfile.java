import org.junit.*;

import static edu.gvsu.mipsunit.munit.MUnit.Register.*;
import static edu.gvsu.mipsunit.munit.MUnit.*;

public class nCktestfile {

    @Before
    public void before() {
    set(v0, 1337);
    }

    /******************************************************************
     *
     * Test makes10
     *
     *****************************************************************/

    @Test 
    public void nCk_5_3() {
    run("nCk", 5, 3);
    Assert.assertEquals(10, get(v0));
	System.out.println("done 1");
    }
    @Test 
    public void nCk_10_5() {
    run("nCk", 10, 5);
    Assert.assertEquals(252, get(v0));
	System.out.println("done 2");
    }	
    @Test 
    public void nCk_12_2() {
    run("nCk", 12, 2);
    Assert.assertEquals(66, get(v0));
	System.out.println("done 3");
    }
    @Test 
    public void nCk_15_3() {
    run("nCk", 15, 3);
    Assert.assertEquals(455, get(v0));
	System.out.println("done 4");
    }
    @Test 
    public void nCk_7_2() {
    run("nCk", 7, 2);
    Assert.assertEquals(21, get(v0));
	System.out.println("done 5");
    }
    
    @Test 
    public void nCk_31_31() {
    run("nCk", 31, 31);
    Assert.assertEquals(1, get(v0));
	System.out.println("done 6");
    }
    @Test 
    public void nCk_10_0() {
    run("nCk", 10, 0);
    Assert.assertEquals(1, get(v0));
	System.out.println("done 7");
    }
    @Test 
    public void nCk_12_5() {
    run("nCk", 12, 5);
    Assert.assertEquals(792, get(v0));
	System.out.println("done 8");
    }
    @Test 
    public void nCk_16_13() {
    run("nCk", 16, 13);
    Assert.assertEquals(560, get(v0));
	System.out.println("done 9");
    }
    @Test 
    public void nCk_18_6() {
    run("nCk", 18, 6);
    Assert.assertEquals(18564, get(v0));
	System.out.println("done 10");
    }
    @Test 
    public void nCk_11_9() {
    run("nCk", 11, 9);
    Assert.assertEquals(55, get(v0));
	System.out.println("done 11");
    }
    @Test
    public void nCk_6_7() {
    run("nCk", 6, 7);
    Assert.assertEquals(-1, get(v0));
	System.out.println("done 12");
    }
    @Test 
    public void nCk_6_6() {
    run("nCk", 6, 6);
    Assert.assertEquals(1, get(v0));
	System.out.println("done 13");
    }
    @Test 
    public void nCk_6_5() {
    run("nCk", 6, 5);
    Assert.assertEquals(6, get(v0));
	System.out.println("done 14");
    }
    @Test 
    public void nCk_6_4() {
    run("nCk", 6, 4);
    Assert.assertEquals(15, get(v0));
	System.out.println("done 15");
    }
    @Test 
    public void nCk_6_3() {
    run("nCk", 6, 3);
    Assert.assertEquals(20, get(v0));
	System.out.println("done 16");
    }
    @Test 
    public void nCk_6_2() {
    run("nCk", 6, 2);
    Assert.assertEquals(15, get(v0));
	System.out.println("done 17");
    }
    @Test 
    public void nCk_6_1() {
    run("nCk", 6, 1);
    Assert.assertEquals(6, get(v0));
	System.out.println("done 18");
    }
	@Test 
    public void nCk_6_0() {
    run("nCk", 6, 0);
    Assert.assertEquals(1, get(v0));
	System.out.println("done 19");
    }
	@Test 
    public void nCk_31_2() {
    run("nCk", 31, 2);
    Assert.assertEquals(465, get(v0));
	System.out.println("done 20");
    }
	
} // end class


