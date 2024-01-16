<?php

namespace backend\tests\unit;

use UnitTester;

class ArchiveTest extends \Codeception\Test\Unit
{
    /**
    * @var UnitTester
    */
    protected UnitTester $tester;

    public function TestValidateArchiveTest()
    {
        $archivetest = new backend\models\ArchiveCategory();

                    /* sequence */
                            $archivetest->setAttribute('sequence', '99');
                $this->assertTrue($archivetest->validate(['sequence']));
            
                            $archivetest->setAttribute('sequence', 'Sint accusantium in reprehenderit et harum. Sapiente consectetur ab culpa. Voluptas aut voluptas architecto quibusdam reprehenderit deleniti consequuntur aperiam.');
                $this->assertFalse($archivetest->validate(['sequence']));
                        /* sequence */
                    /* created_by */
                            $archivetest->setAttribute('created_by', '583639');
                $this->assertTrue($archivetest->validate(['created_by']));
            
                            $archivetest->setAttribute('created_by', 'Molestiae et eum architecto omnis. Placeat corrupti ipsum dolore. Sed ipsam fuga delectus officiis sint voluptatem.');
                $this->assertFalse($archivetest->validate(['created_by']));
                        /* created_by */
                    /* updated_by */
                            $archivetest->setAttribute('updated_by', '1284425');
                $this->assertTrue($archivetest->validate(['updated_by']));
            
                            $archivetest->setAttribute('updated_by', 'Ratione similique dolorum earum repellat. Eaque est reprehenderit beatae quaerat explicabo. Est qui itaque vitae explicabo corrupti eius. Molestias laboriosam at quasi recusandae.');
                $this->assertFalse($archivetest->validate(['updated_by']));
                        /* updated_by */
                    /* is_deleted */
                            $archivetest->setAttribute('is_deleted', '434');
                $this->assertTrue($archivetest->validate(['is_deleted']));
            
                            $archivetest->setAttribute('is_deleted', 'At id fugiat sunt quaerat. Ea dolores non maiores dolorem suscipit. Nemo iste deserunt delectus. Asperiores voluptatem sit a placeat.');
                $this->assertFalse($archivetest->validate(['is_deleted']));
                        /* is_deleted */
                    /* deleted_by */
                            $archivetest->setAttribute('deleted_by', '60');
                $this->assertTrue($archivetest->validate(['deleted_by']));
            
                            $archivetest->setAttribute('deleted_by', 'Neque repellendus impedit perspiciatis. Sed ea maiores et magnam. Assumenda facilis a sit vero odit iusto quis. Totam qui enim aliquam esse. Sed in reiciendis eos amet officia quaerat aut.');
                $this->assertFalse($archivetest->validate(['deleted_by']));
                        /* deleted_by */
                    /* verlock */
                            $archivetest->setAttribute('verlock', '366799');
                $this->assertTrue($archivetest->validate(['verlock']));
            
                            $archivetest->setAttribute('verlock', 'Autem harum dignissimos ipsam quod mollitia itaque. Sit sunt quibusdam occaecati ipsum est. Iusto sit perspiciatis dolores omnis deleniti. Magni reprehenderit et excepturi nihil qui nesciunt.');
                $this->assertFalse($archivetest->validate(['verlock']));
                        /* verlock */
                    /* description */
                            $archivetest->setAttribute('description', 'Est velit aliquam quos reiciendis porro eos molestias. Quam repellat ab qui facilis fuga quia. Consequatur tempora nisi sunt quia.');
                $this->assertTrue($archivetest->validate(['description']));
            
                            $archivetest->setAttribute('description', '1530183143');
                $this->assertFalse($archivetest->validate(['description']));
                        /* description */
                    /* title */
                            $archivetest->setAttribute('title', 'Qui impedit sit laboriosam quia eum dolorem dolorem. Qui harum harum et aut. Qui officiis et eos eaque voluptas voluptatibus.');
                $this->assertTrue($archivetest->validate(['title']));
            
                            $archivetest->setAttribute('title', '1814455913');
                $this->assertFalse($archivetest->validate(['title']));
                        /* title */
            }
}

